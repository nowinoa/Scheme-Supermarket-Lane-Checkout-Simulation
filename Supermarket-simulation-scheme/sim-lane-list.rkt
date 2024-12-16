;; done
(module sim-lane-list racket
  (provide lane-list?
           less-crowded
           )

  (require "sim-lane.rkt")

  
  
  (define (lane-list? lanes)
    ;; Check if all the elements of a list are type lane
    ;; Returns a boolean: True if all elements are lanes, False if at least one element is not a lane
    (andmap lane? lanes))
    


  ;; This is a sort of "priority queue"
  ;; in O(nlog(n))
  ;; This function returns the lane with less customers from a list of lane
  (define (less-crowded sim-lanes)
    (let
        ([sorted-lanes (sort sim-lanes
                             (lambda (l1 l2)
                               ;; if the till is bussy the total will be lane-length + 1
                               (< (calculate-total-customers l1)
                                  (calculate-total-customers l2))))])
      (car sorted-lanes)))

  (define (calculate-total-customers lane)
    ;; Calculates the total number of customers in a lane
    ;; because we want to take in count the customers that are being process at the till
    ;; so in customer meanings: (cons 1 (cons 2 empty))>(cons 2 (cons null empty))
    (if (lane-bussy? lane)
        (+ 1 (lane-length lane))
        (lane-length lane)))
  )