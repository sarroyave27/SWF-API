import { Router } from "express";
import { ping } from "../controllers/index.controller.js";

const router = Router();
// Ruta para el endpoint "/ping" que llama a la función "ping" del controlador
router.get("/ping", ping);
  
export default router;