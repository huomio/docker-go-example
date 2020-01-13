package server

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

func Run()  {
	fmt.Println("Starting the server!")
	assets := flag.String("assets", "dist/", "asset root")
	port := flag.String("port", "8080", "port number for server")
	flag.Parse()
	http.Handle("/", http.FileServer(http.Dir(*assets)))
	http.HandleFunc("/api/answer", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("This is the response!"))
	})
	fmt.Println("Serving static assets from:", *assets)
	log.Fatal(http.ListenAndServe(":"+*port, nil))
}
