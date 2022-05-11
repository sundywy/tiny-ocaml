let rec items_to_string items =
  match items with
  | [] -> ""
  | [ x ] -> x
  | [ x; y ] -> x ^ " and " ^ y
  | [ x; y; z ] -> x ^ ", " ^ y ^ ", and " ^ z
  | x :: xs -> x ^ ", " ^ items_to_string xs

let picnic items sorted =
  let ls = if sorted then List.sort compare items else items in
  print_endline ("You are bringing " ^ items_to_string ls ^ ".")

open Cmdliner

let items =
  let env =
    let doc = "Items to bring." in
    Cmd.Env.info "ITEMS" ~doc
  in
  let doc = "Item(s) to bring" in
  Arg.(non_empty & pos_all string [] & info [] ~env ~docv:"ITEMS" ~doc)

let sorted =
  let doc = "Sort the list" in
  Arg.(value & flag & info [ "s"; "sorted" ] ~docv:"SORTED" ~doc)

let picnic_t = Term.(const picnic $ items $ sorted)

let cmd =
  let doc = "what to bring in picnic" in
  let man =
    [ `S Manpage.s_bugs; `P "Email bug reports to <sundy.yap@gmail.com>." ]
  in
  let info = Cmd.info "picnic" ~version:"%‌%VERSION%%" ~doc ~man in
  Cmd.v info picnic_t

let main () = exit (Cmd.eval cmd)
let () = main ()
