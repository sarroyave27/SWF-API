import { Router } from "express";
import * as controllers from "../controllers/users.controller.js"

const router = Router();
// Ruta para obtener todos los usuarios
  router.get("/users", controllers.getUsers) 
// Ruta para obtener un usuario por su código
  router.get("/users/:COD_USUARIO", controllers.getUser) 
// Ruta para crear un nuevo usuario
  router.post("/users", controllers.createUsers) 
  // Ruta para desactivar un usuario
  router.patch("/users/:COD_USUARIO", controllers.disableUser)
// Ruta para consultar un usuario por correo electrónico y contraseña
  router.post("/consult", controllers.consultUser) 
  
export default router;

