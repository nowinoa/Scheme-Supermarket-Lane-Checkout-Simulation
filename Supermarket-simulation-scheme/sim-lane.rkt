(module sim-lane racket
  (provide lane
           lane?
           lane-id
           lane-user
           lane-bussy?
           lane->string
           lane-length
           lane-pop
           lane-queue
           ; These routines fire events
           lane-append!
           lane-pop!
           lane-bussy-set!
           )

  (require racket/match)
  (define sim-fire-event! null) ; hack to passed procedure


  
  ;; A lane (id . (user . list) 
  (define (lane id sym)
    (set! sim-fire-event! sym) ;; dirty hack
    (cons id (cons null null)))

  ;; lane-length?
  ;; Return the number of customers waiting in the lane  - length of the list
  (define (lane-length lane)
    (length (cdr (cdr lane))))

      
  
  ;; lane?
  ;; Checks if a lane has a valid format (cons 1 (cons 2 (list 1 2)))
  ;; where list can be empty and the second integer can be null
  (define (lane? val)
    (and (pair? val)
       (number? (car val))
       (pair? (cdr val))
       (or (number? (car (cdr val)))
           (null? (car (cdr val))))
       (or (null? (cdr (cdr val)))
           (and (pair? (cdr (cdr val)))
                (or (number? (car (cdr (cdr val))))
                    (null? (car (cdr (cdr val)))))))))



  ;; ERRORS TO FIX
  ;;(lane? (cons "www" (cons 2 empty))) = f
  ;;(lane? (cons 2 (cons 2 empty)))= f / shoudl be true
  ;;(lane? (cons 3 (cons 2 (list 5 5)))) = t


  ;; lane-bussy?
  ;; Checks if any customer is being process at the lane
  ;; Returns true when is an integer, false when null
  (define (lane-bussy? lane)
    (number? (car (cdr lane))))

  (define (lane-bussy-set ln user)
    (match ln
      [(cons id (cons _ q))
       (cons id (cons user q))]))

  ;; lane-id
  ;; Returns an integer with the lane id - (cons X (cons null (list 1 2))) = X
  (define (lane-id lane)
    (car lane))
  
  ;; lane-user
  ;; Returns an integer with customer id that is being process at the till
  ;; (cons 0 (cons X (list 1 2))) = X
  (define (lane-user val)
    (car (cdr val)))

  ;; lane-queue
  ;; Returns a list containing the customers waiting at the till
  (define (lane-queue val)
    (cdr (cdr val)))

 
  ;; Free
  (define (lane->string ln)
    (let
        ([lane-qu-str (apply
                       string-append 
                       (map
                        (lambda (x)(format "~a:" x))
                        (lane-queue ln)))]
          )
      (format "L(~a)[~a]|<=~a"
              (lane-id ln)
              (~a
               (if (lane-bussy? ln) (lane-user ln) "None" ) #:min-width 4)
              lane-qu-str)))

  ;; Pure
  ;; Free
  (define (lane-append ln user)
    (match ln
      [(cons id (cons u q))
       (cons id (cons u (append q (list user))))]))

  ;; Free
  (define (lane-pop ln)
    (match ln
      [(cons id (cons u (cons q qs)))
       (values q
               (cons id (cons u qs)))]))


  ; IO() fires an event
  (define (lane-bussy-set! ln user)
    (let
        ([new-lane (lane-bussy-set ln user)])
      (begin       
        (if (and
             (> (lane-length new-lane) 0)  
             (not (lane-bussy? new-lane))) ;; till is free
            (begin
              (sim-fire-event! 2(first (lane-queue new-lane)) (lane-id new-lane))) ;; CHECKOUT
            (void))
        )          
      new-lane))

  ;; IO () fires an event
  (define (lane-append! ln user)
    (let
        ([new-lane (lane-append ln user)])
      (begin
        (if (and
             (= (lane-length new-lane) 1)  ;; i'm the only 
             (not (lane-bussy? new-lane))) ;; till is free
            (sim-fire-event! 2 user (lane-id new-lane)) ;; CHECKOUT
            (void))
        )          
      new-lane))
         

  ;; IO() fires an event
  (define (lane-pop! ln )
    (let*-values
        ([(user new-lane) (lane-pop ln )]
         [ (new-la2) (lane-bussy-set new-lane user)]
         )
      (begin
        (sim-fire-event! 3 user (lane-id new-la2)) ;; CHECKOUT
        new-la2)))



  
    
  )