#-(and sbcl x86-64)
(error "Only SBCL x86-64 is supported.")
#+(and sbcl x86-64)
(defsystem fast-mpsc-queue
  :license "MIT"
  :homepage "https://github.com/kchanqvq/fast-mpsc-queue"
  :description "Multi-Producer Single-Consumer queue implementation."
  :long-description "This is a Multi-Producer Single-Consumer queue implementation specific to SBCL x86-64. It implements the beautiful algorithm found at \"Non-intrusive MPSC node-based queue\", and is intended for developing high-performance Actor systems."
  :depends-on (:metabang-bind)
  :serial t
  :components ((:file "package")
               (:file "atomic-swap-car")
               (:file "mpsc-queue")))
