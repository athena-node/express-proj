// import express
const express = require('express');
const app = express();

// env settings
let env_info = {
    NODE_PORT: process.env.NODE_PORT || 1337, // production default:1337
    NODE_ENV: (process.env.NODE_ENV || 'production').toLowerCase(),
}

console.log(`current port: ${env_info.NODE_PORT}, env: ${env_info.NODE_ENV}`);

// set router
app.get('/', (req, res) => {
  res.send('Hello World!')
});

// send json data
app.post("/foo",(req,res) => {
    console.log("request foo");
    let obj = {
        code : 0,
        message:"ok",
        data:{
            "langs":["nodejs","go","rust","php","js"]
        }
    };
    res.json(obj);
});

// run app
app.listen(env_info.NODE_PORT, () => {
  console.log(`Example app listening on port ${env_info.NODE_PORT}`)
});
