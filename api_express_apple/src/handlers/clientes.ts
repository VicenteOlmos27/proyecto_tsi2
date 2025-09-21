import { Request, Response } from "express"

export const getClientes = async(request:Request, response:Response)=>{
    response.json("CLIENTES")
}