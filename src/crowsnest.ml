let crowsnest word =
  let article =
    let word_lower = String.lowercase_ascii word in
    let char = String.get word_lower 0 in
    match char with 'a' | 'i' | 'u' | 'e' | 'o' -> "an" | _ -> "a"
  in
  print_endline
    ("Ahoy, Captain, " ^ article ^ " " ^ word ^ " off the larboard bow!")

open Cmdliner

let word =
  let env =
    let doc = "A word." in
    Cmd.Env.info "WORD" ~doc
  in
  let doc = "The word to call" in
  Arg.(required & pos 0 (some string) None & info [] ~env ~docv:"WORD" ~doc)

let crowsnest_t = Term.(const crowsnest $ word)

let cmd =
  let doc = "choose the correct articlesay hello to caller" in
  let man =
    [ `S Manpage.s_bugs; `P "Email bug reports to <sundy.yap@gmail.com>." ]
  in
  let info = Cmd.info "crowsnest" ~version:"%‌%VERSION%%" ~doc ~man in
  Cmd.v info crowsnest_t

let main () = exit (Cmd.eval cmd)
let () = main ()
