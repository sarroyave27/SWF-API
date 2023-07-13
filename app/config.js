import { config } from "dotenv"
// Carga las variables de entorno desde el archivo .env
config()
// Configuración de las variables de entorno
export const PORT = process.env.PORT || 3000
export const DB_USER = process.env.DB_USER || "root"
export const DB_PASSWORD = process.env.DB_PASSWORD || ""
export const DB_HOST = process.env.DB_HOST || "localhost"
export const DB_DATABASE = process.env.DB_DATABASE || "streetwisefitness"
export const DB_PORT = process.env.DB_PORT || 3306
