const app = require('express')()

app.get('/', (req, res) =>{
    res.json({message: 'Blank'})
})

const port = process.env.PORT || 8080

app.listen(port, () => {
    console.log(`Listening at https://http://localhost:${port}/`)
})