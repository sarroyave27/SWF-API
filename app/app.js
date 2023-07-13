import express from "express";
import usersRoutes from "./routes/users.routes.js";
import planRoutes from "./routes/plan.routes.js";
import recipeRoutes from "./routes/recipe.routes.js"

const app = express();

// Configuración del puerto
app.set("PORT",process.env.PORT || 3000);
// Middleware para el manejo de datos en formato JSON
app.use(express.json());
// Rutas de los usuarios
app.use("/api", usersRoutes);
// Rutas de los planes
app.use("/plan", planRoutes);
// Rutas de las recetas
app.use("/recipes", recipeRoutes);
// Ruta de bienvenida
app.use((req, res) => {
    res.status(200).json({message: "Bienvenido al BackEnd de StreetWiseFitness"})
})

export default app; 