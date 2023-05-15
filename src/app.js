import express from "express";
import usersRoutes from "./routes/users.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();

app.use(express.json());

app.use(indexRoutes);
app.use("/api", usersRoutes);

app.use((req, res, next) => {
    res.status(400).json({message: "Not Found"})
})

export default app; 