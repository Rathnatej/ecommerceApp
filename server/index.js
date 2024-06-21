const express=require('express');
const mongoose=require('mongoose');
const authRouter=require('./routes/auth');
const { connected } = require('process');
const exp = require('constants');


const port=3000
const app=express();
app.use(express.json());
app.use(authRouter);
app.use(express.json());
mongoose.connect('mongodb+srv://rathnatejachidrala:UgRTMaZYLc4aUaCf@ecommerceapp.wsx10r7.mongodb.net/?retryWrites=true&w=majority&appName=EcommerceApp').then(()=>{
    console.log("connected");
}).catch((e)=>{
    console.log(e);
})
app.listen(port,()=>{
    console.log(port);
})