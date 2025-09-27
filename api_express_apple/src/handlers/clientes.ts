
import { Request, Response } from "express";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import Cliente from "../models/Cliente";
import Usuario from "../models/Usuario";

export const login = async (request: Request, response: Response) => {
  const { rutCliente, contrasena } = request.body;
  const SECRET = process.env.SECRET_KEY;

  try {
    const cliente = await Cliente.findByPk(rutCliente);
    if (!cliente || !bcrypt.compareSync(contrasena, cliente.contrasena)) {
      return response.status(401).json({ error: "Credenciales incorrectas" });
    }

    const token = jwt.sign({ rut: cliente.rutCliente }, SECRET!, {
      expiresIn: "1h",
    });

    response.json({ token });
  } catch (error) {
    console.error("Error de login: ", error);
    response.status(500).json({ error: "Error interno del servidor" });
  }
};

export const crearCliente = async (request: Request, response: Response) => {
  const {
    rutCliente,
    nombreApellido,
    correo,
    direccion,
    telefono,
    contrasena,
  } = request.body;

  if (!rutCliente || !contrasena) {
    return response
      .status(400)
      .json({ error: "Rut y Contraseña son obligatorios" });
  }

  try {
    const existe = await Cliente.findByPk(rutCliente);
    if (existe) {
      return response
        .status(409)
        .json({ error: "Este usuario ya está registrado" });
    }

    // Crear cliente
    const nuevoCliente = await Cliente.create({
      rutCliente,
      nombreApellido,
      correo,
      direccion,
      telefono,
      contrasena,
    });

    // Crear usuario asociado
    const hash = await bcrypt.hash(contrasena, 10);
    await Usuario.create({
      cod_usuario: rutCliente,
      nombre_usuario: nombreApellido,
      contraseña: hash,
      tipo_usuario: 0, // cliente
    });

    response.status(201).json({
      message: "Cliente creado correctamente",
    });
  } catch (error) {
    console.error("Error al registrar el cliente/usuario: ", error);
    response.status(500).json({ error: "Error interno del servidor" });
  }
};

