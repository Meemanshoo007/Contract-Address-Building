const express = require('express');

const app = express()
require('dotenv').config();
const connectDB = require('./db/connect');

const candidateRoutes = require('./routes/candidateRoutes.js')

app.use(express.json())

app.use("/api",candidateRoutes)


connectDB(process.env.MONGODB_URL).then(() => {
    console.log("Database Connected");

    app.listen(3000, () => {
        console.log("Server is listning on PORT 3000");
    });
}).catch((error)=>{
    console.log(error);
});


