import express from "express";
import usersRoutes from "./routes/users.routes.js";
import planRoutes from "./routes/plan.routes.js";

const app = express();
app.set("PORT",process.env.PORT || 3000);

app.use(express.json());

app.use("/api", usersRoutes);
app.use("/plan", planRoutes);

app.use((req, res) => {
    res.status(200).json({message: "Bienvenido al BackEnd de StreetWiseFitness"})
})

export default app; 