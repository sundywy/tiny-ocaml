(lang dune 2.9)
(name tiny)
(version 0.1.0)

(generate_opam_files true)

(source (github sundywy/tiny-ocaml))
(authors "Sundy Yaputra")
(maintainers "sundy.yap@gmail.com")

(package
 (name tiny)
 (synopsis "An application that say hello")
 (version 0.1.0)
  (depends
   (alcotest :with-test)
   (dune (> 1.5))
   (cmdliner (> 1.0.0))))
