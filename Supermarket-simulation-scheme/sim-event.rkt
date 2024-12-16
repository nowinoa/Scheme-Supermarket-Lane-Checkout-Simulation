(module event racket
  (provide event
           event?
           event-time
           event-type
           event-user
           event-lane
           event-params
           ENTER_EVENT
           CHECKOUT_EVENT
           LEAVE_EVENT
           event->string
           )

  (define ENTER_EVENT 1)
  (define CHECKOUT_EVENT 2)
  (define LEAVE_EVENT 3)

  (define event-dict
    (list (cons ENTER_EVENT "ENTER_EVENT")
          (cons CHECKOUT_EVENT "CHECKOUT_EVENT")
          (cons LEAVE_EVENT "LEAVE_EVENT")))
          

  ;; constructor.
  ;; ( time . ( id . (user . id-lane)))
  ;; event
  ;; time (int), id (int), params (pair of int)
  (define (event time id params)
    (cons time ( cons id params )))

  ;; P: True
  ;; Format: (cons time (cons event-type (cons customerID laneID)))
  ;; Returns true if the format is an event type, false if the format is different
  (define (event? val)
     (and (pair? val)
          ;; time in seconds
          (number? (car val))
          (pair? (cdr val))
          ;; event-type
          (number? (car (cdr val)))
          ;; HERE THE NEXT VALUE CAN BE A NULL OR A PAIR
          (pair? (cdr ( cdr val)))
          ;; customer ID
          (number? (car (cdr (cdr val))))
          ;; lane ID
          (number? (cdr (cdr (cdr val))))))
          

  ;; P: valid event
  ;; event-time: returns an integer (time in seconds)
  (define (event-time ev)
    (car ev))

  ;; P: valid event
  ;; event-type: returns a integer containing the event-type (1,2 or 3)
  (define (event-type ev)
   (car (cdr ev)))

  

  ;; P: event-params
  ;; event-params returns the last pair of the event, containing the customer and lane id
  (define (event-params ev)
    (cdr(cdr ev)))

;; event-user: returns the first integer of the last pair (params) with the customer id
  (define (event-user ev)
    (car (cdr (cdr ev))))

;; event-lane:returns the last integer of the last pair (params) with the lane id
  (define (event-lane ev)
    (cdr (cdr (cdr ev))))




  (require racket/dict)
  (define (event->string ev)
    (format "~a"
            (dict-ref event-dict (event-type ev))
            ))
  )