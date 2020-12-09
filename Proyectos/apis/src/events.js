const express = require('express');

function createRouter(db) {
    const router = express.Router();
    const owner = '';

    // the routes are defined here
    router.get('/test', (req, res, next) => {
        res.json({ message: "Welcome to bezkoder application." })
    });

    router.post('/insert', (req, res, next) => {
        db.query(
            'INSERT INTO `usuarios` (`ID_USUARIO`, `CEDULA_USUARIO`, `NOMBRE`, `APELLIDO`, `CORREO`, `CLAVE`) VALUES (?,?,?,?,?,?)', [req.body.id, req.body.cedula, req.body.nombre, req.body.apellido, req.body.correo, req.body.clave],
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
