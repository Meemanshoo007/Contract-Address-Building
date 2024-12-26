import Dummy from './Dummy'

import Web3Provider from './context/Web3Provider'
import RegisterCandidate from './pages/Candidate/RegisterCandidate'
import { routes } from './routes/routes'
import { RouterProvider } from 'react-router-dom'
import './App.css'

function App() {
  return (
    <>
     <Web3Provider>
       {/* <Dummy></Dummy> */}
       <RouterProvider router={routes}></RouterProvider>
     </Web3Provider>
    </>
  )
}

export default App