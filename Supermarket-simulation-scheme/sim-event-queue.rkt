;; Done
(module sim-event-queue racket
  (provide
   sim-add-event
   )

  (require "sim-event.rkt")

  ;; This is a sort of "priority queue"
  ;; in O(nlog(n))
  ;; Append a new event to the list and sort it in ascending order based on time
  ;; If time is the same, then sort by user id
  ;; Returns a sorted list of events
  (define (sim-add-event sim-event-queue ev) 
    (sort (append sim-event-queue (list ev))
          (lambda (l1 l2)
            (cond
              [(= (event-time l1) (event-time l2))
               (< (event-user l1) (event-user l2))]
              [else (< (event-time l1) (event-time l2))]))))


)

;; append the event to the list
;; if time = 0 then sort those by customer id (car (cdr (cdr ev)))
;; if is more than 0 then sort in ascending orderv (car ev)

;;(0 1 1.0)
;;(0 1 2.0)
;;(5 3 1.0)

