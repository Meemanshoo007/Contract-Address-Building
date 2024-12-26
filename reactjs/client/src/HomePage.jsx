import {Link} from 'react-router-dom'; 

import './App.css'

function HomePage() {



  return (
    <>
   
  
    <h1>Home</h1>
    <Link to="/form">Go to Form Page</Link>
    {/* <a href='/form'>Go to Form Page</a> */}
   
    </>
  )
}

export default HomePage
