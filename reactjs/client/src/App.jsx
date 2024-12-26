import { useEffect, useState } from 'react'

import {createBrowserRouter,RouterProvider} from 'react-router-dom'
import FormPage from './form.jsx'
import HomePage from './HomePage.jsx'

import './App.css'

function App() {

  const route = createBrowserRouter([
    {
      path: "/",element: <HomePage></HomePage>
    },
    {
      path: "/form",element: <FormPage></FormPage>
    }
  ])

  // const [count, setCount] = useState(0)

  // useEffect(()=>{

  //   const clicker = ()=>{
  //     console.log("useEffect running")
  //   }
   
  //   document.body.addEventListener("click",clicker)



  //   return ()=>{
  //     document.body.removeEventListener("click",clicker)
  //     console.log("Cleaning the mass created by useEffect")
  //   }
  // },[count])

  return (
    <>
    {/* <p>Counter = {count}</p>
    <button onClick={()=>setCount(count+1)}>Click me</button> */}
    {/* <FormPage></FormPage> */}
      <RouterProvider router={route}></RouterProvider>
    </>
  )
}

export default App
