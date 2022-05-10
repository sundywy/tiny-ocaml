open Cmdliner

(* implementation *)

let hello name = print_endline ("Hello, " ^ name ^ "!")

(* command line interface *)

let nom =
  let doc = "Name to greet" in
  Arg.(value & opt string "World" & info [ "n"; "name" ] ~docv:"NAME" ~doc)

let hello_t = Term.(const hello $ nom)

let cmd =
  let doc = "say hello to caller" in
  let man =
    [ `S Manpage.s_bugs; `P "Email bug reports to <sundy.yap@gmail.com>." ]
  in
  let info = Cmd.info "hello" ~version:"%‌%VERSION%%" ~doc ~man in
  Cmd.v info hello_t

let main () = exit (Cmd.eval cmd)
let () = main ()
