(in-package :fast-mpsc-queue)
(defmacro benchmark (make-queue enqueue dequeue)
  `(let ((q (,make-queue)))
     (time
      (progn
        (map nil #'bt:join-thread
             (cons
              (bt:make-thread
               (lambda ()
                 (let ((count 0))
                   (loop for x = (,dequeue q)
                         when x do (incf count)
                           while (< count 1000000))))
               :name "consumer")
              (mapcar (lambda (x)
                        (bt:make-thread
                         (lambda ()
                           (dotimes (n 125000)
                             (,enqueue :foo q)))
                         :name x))
                      (mapcar (lambda (n) (format nil "producer-~a" n))
                              (loop :for n :from 1 :to 8 :collect n)))))))))
(defun benchmark-fast ()
  (benchmark make-queue enqueue dequeue))
(require :sb-concurrency)
(defun benchmark-sb-concurrency ()
  (benchmark sb-concurrency:make-queue sb-concurrency:enqueue sb-concurrency:dequeue))
