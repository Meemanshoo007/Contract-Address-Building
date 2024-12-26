import {useRef} from 'react'

import './App.css'

function FormPage() {


    const nameRef = useRef(null);
    const passwordRef = useRef(null);

    const inputReader = async (e)=>{
        e.preventDefault();
        const name = nameRef.current.value;
        const password = passwordRef.current.value;

        try{


            const res = await fetch('http://localhost:3000/user',{
                method:"POST",
                headers:{"Content-Type" : "application/json"},
                body:JSON.stringify({
                    name,
                    password
                })
            })
    
            if(res.ok){
                const data = await res.json();
                console.log(data);
            }
            else{
                throw new Error("Response Failed");
            }

            

        }catch(error){
            console.log(error);
        }

    }
  return (
    <>
   
    <form onSubmit={inputReader}>
    <p>Form</p>
    <input ref={nameRef} type='text'></input><br/><br/>
    <input ref={passwordRef} type='password'></input><br/><br/>
    <button type='submit'>Submit</button>
    </form>
    </>
  )
}

export default FormPage
