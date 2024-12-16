;; Ainhoa Prada Tello - 001352985
#lang scheme

 (require "sim-event.rkt")
 (require "sim-event-queue.rkt")
 (require "sim-utils.rkt")
 (require "sim-lane-list.rkt")
 (require "sim-lane.rkt")

;F6 Additional feature
;---------------------

;F6.1.i
;======
;by mapping the list of lanes, this function returns a list of the lists of customers waiting in the queue for each lane
; input (list): a list of lanes
; output (list): a list of list containing the customer id waiting in each lane
(define (all-cust-wait_lst ln-lst)
  (map lane-queue ln-lst))

;F6.1.ii
;=======
 ;; This function returns the lane with less customers from a list of lane
 ;; Input (list): a list of lanes
 ;; Output (lane): the most crowded lane (lane format)
(define (most-crowded ln-lst)
  (let
        ([sorted-lanes (sort ln-lst
                             (lambda (l1 l2)
                               ; if the till is bussy the total will be lane-length + 1
                               (> (calculate-total-customers l1)
                                  (calculate-total-customers l2))))])
      (car sorted-lanes)))

  (define (calculate-total-customers lane)
    ;; Calculates the total number of customers in a lane
    ;; because we want to take in count the customers that are being process at the till
    ;; so in customer meanings: (cons 1 (cons 2 empty))>(cons 2 (cons null empty))
    (if (lane-bussy? lane)
        (+ 1 (lane-length lane))
        (lane-length lane)))



;F6.2.i
;======
;by mapping a list of events, this function returns a list of customer and lane IDs as pairs
; Input (list): a list of events
; Output (list): a list of pairs (customer id - lane id)
(define (event-params-lst ev-lst)
  (map event-params ev-lst))

;F6.2.ii
;=======
; is-sorted uses the function sort-event to compare its output with the input
; input (list): a list of events
; Output (boolean): True when the ev-list is sorted, False when ev-list is not sorted
(define (is-sorted? ev-lst)
  (let ((sorted-ev-lst (sort-event ev-lst)))
    (equal? ev-lst sorted-ev-lst)))

(define (sort-event ev-lst)
  ;; sorts an event by time
  ;; if two events have the same time attached
     ;; events are sorted by customer id
  ; input (list): list of events
  ; output (list): list of sorted events 
  (sort ev-lst
        (lambda (l1 l2)
          (cond
            [(= (event-time l1) (event-time l2))
             (< (event-user l1) (event-user l2))]
            [else (< (event-time l1) (event-time l2))]))))


