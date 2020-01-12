package server

import (
	"fmt"
	"log"
	"net/http"
)

func Run()  {
	fmt.Print("Starting the server!")
	http.Handle("/", http.FileServer(http.Dir("dist/")))
	http.HandleFunc("/api/answer", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("This is the response!"))
	})
	log.Fatal(http.ListenAndServe(":80", nil))
}
