const mongoose=require('mongoose');
const userSchema=mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,
    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                const re= /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                 value.match(re);

            },
            message:"please enter a proper email",
        }

    },
    password:{
        required:true,
        type:String,
        

    },
    type:{
        type:String,
        default:'user',
    }
});
const User=mongoose.model("User",userSchema);
module.exports=User;