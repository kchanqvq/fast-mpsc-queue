(defpackage fast-mpsc-queue
    (:use #:cl #:bind)
  (:export
   #:atomic-swap-car
   #:enqueue
   #:dequeue
   #:empty-p
   #:make-queue))
