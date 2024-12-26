const express = require('express')
const router = express.Router()

const CandidateModel = require("../models/CandidateSchema")



router.post('/postCandidateImage',async (req,res) =>{
    try{
        const {accountAddress,imageName} = req.body;
        const saveCandidate = await CandidateModel.create({
            accountAddress:accountAddress,
            imageName: imageName
        })
        res.status(200).json(saveCandidate)
    }catch(error){
        res.status(200).json({
            status: false,
            message: "Something went wrong"
        })
    }
})

router.post('/getAllCandidateImage',async (req,res) =>{
    try{
     
        
        const saveCandidate = await CandidateModel.find()
        res.status(200).json(saveCandidate)
    }catch(error){
        res.status(200).json({
            status: false,
            message: "Something went wrong"
        })
    }
})



module.exports = router;