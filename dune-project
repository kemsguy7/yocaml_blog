(lang dune 3.0)
(name joy_blog)
(version 0.1.0)
(generate_opam_files true)

(source (github kemsguy7/yocaml_blog))
(license MIT)
(authors "Kemsguy7")
(maintainers "kemsguy7@github.com")

(package
 (name joy_blog)
 (synopsis "Joy's Beautiful Apple-themed Blog")
 (description "A static blog generated with YOCaml")
 (depends
  (ocaml (>= 5.3.0))
  (yocaml (>= 2.5.0))
  (yocaml_unix (>= 2.5.0))
  (yocaml_yaml (>= 2.5.0))
  (yocaml_jingoo (>= 2.5.0))
  (yocaml_syndication (>= 2.5.0))
  (yocaml_markdown (= 2.5.0))
  (cmarkit (>= 0.3.0))
  (hilite (>= 0.5.0))
  (ocamlformat :with-dev-setup)))


