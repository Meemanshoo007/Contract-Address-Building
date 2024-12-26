const express  = require('express');
const cors  = require('cors');

const app = express();

const PORT = 3000;


app.use(express.json())
app.use(cors())



app.get("/", (req,res) => {
    console.log(`Client is requesting.`);
    const {userName} = req.query;
    res.send(`Hi ${userName}`);
})

app.post("/user", (req,res) => {
  
    const {name,password} = req.body;

    if(!name || !password){
        res.status(400).json({message: "Failed"})
    }

    res.status(200).json({message: "Successful"})
})



// app.use((req,res,next) => {
//     console.log(`Middleware 2`);
//     next();
// })

// app.use((req,res,next) => {
//     console.log(`Middleware 3`);
//     next();
// })

app.listen(PORT,()=>{
    console.log(`Server is running on port ${PORT}`);
})