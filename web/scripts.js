import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'

const Main = () => {

    const [ answer, setAnswer ] = useState("")

    const askBackend = () => {
        axios.get("/api/answer")
            .then((response) => {
                setAnswer(response.data)
            })
    }

    return (
        <>
            <h2>The coolest app you've ever seen</h2>
            <p>What does the backend say?</p>
            <button onClick={askBackend}>Press this button to find out!</button>
            <p>{answer}</p>
        </>
    )

}

const root = document.getElementById( 'app-root' );
ReactDOM.render( <Main/>, root)