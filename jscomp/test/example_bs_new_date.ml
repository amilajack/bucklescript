
type date
external make_date : unit -> date = "Date" [@@bs.new]
let v = make_date ()   
