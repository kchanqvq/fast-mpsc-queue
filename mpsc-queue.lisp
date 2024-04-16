(in-package :fast-mpsc-queue)
(defun enqueue (item queue)
  "Enqueue `item' into `queue'. Returns `item'."
  (declare (optimize (speed 3)))
  (bind ((n (list item))
         (prev (atomic-swap-car queue n)))
    (setf (cdr prev) n)
    n))
(defun dequeue (queue)
  "Dequeue an value from `queue' and returns it as the primary value, and
T as secondary value. If `queue' is empty, returns `nil' as both
primary and secondary value."
  (declare (optimize (speed 3)))
  (bind ((tail (cdr queue))
         (next (cdr tail)))
    (if next
        (let ((val (car next)))
          (setf (cdr queue) next)
          (setf (car next) t)
          (values val t))
        (values nil nil))))
(defun empty-p (queue)
  (declare (optimize (speed 3)))
  (eq (car queue) (cdr queue)))
(defun make-queue ()
  (let ((stub (list t)))
    (cons stub stub)))
