#-(and sbcl x86-64)
(error "Only SBCL x86-64 is supported.")
#+(and sbcl x86-64)
(defsystem fast-mpsc-queue
  :license "MIT"
  :homepage "https://github.com/kchanqvq/fast-mpsc-queue"
  :depends-on (:metabang-bind)
  :serial t
  :components ((:file "package")
               (:file "atomic-swap-car")
               (:file "mpsc-queue")))
