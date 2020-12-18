const express = require('express');

function createRouter(db) {
    const router = express.Router();
    const owner = '';

    // the routes are defined here
    router.get('/test', (req, res, next) => {
        res.json({ message: "Sistema APIS en linea" })
    });

    router.post('/create/user', (req, res, next) => {
        // var encode = btoa("12345678");
        // console.log(encode);
        db.query(
            'INSERT INTO `USUARIOS` (`CEDULA_USUARIOS`, `NOMBRE_USUARIOS`, `APELLIDO_USUARIOS`, `USERNAME_USUARIOS`, `PASSWORD_USUARIOS`) VALUES (?,?,?,?,?)', [req.body.cedula, req.body.nombre, req.body.apellido, req.body.username, req.body.password],
            (error) => {
                if (error) {
                    console.error(error);
                    res.status(500).json({ status: 'error' });
                } else {
                    res.status(200).json({ status: 'ok' });
                }
            }
        );
    });

    router.post('/login', (req, res, next) => {
        db.query(
            'SELECT * FROM `usuarios` WHERE CORREO=? AND CLAVE=?', [ req.body.correo, req.body.clave],
            (error, results) => {
        if (error) {
          console.log(error);
          res.status(500).json({status: 'error'});
        } else {
          res.status(200).json(results);
        }
      }
        );
    });

    return router;
}

module.exports = createRouter;
