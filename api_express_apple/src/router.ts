import { Router } from "express";
import { getClientes } from "./handlers/clientes";
import { agregarProductos, borrarProductos, editarProductos, getProductoById, getProductos, getProductosConCantidadProductos } from "./handlers/productos";
import { agregarCategoria, borrarCategoria, editarCategoria, getCategoria, getCategoriaById, getCategoriaConCantidadProductos } from "./handlers/categorias";

const router = Router()

//ENPOINT CLIENTES
router.get("/clientes", getClientes)

//ENPOINT CATEGORIAS
router.get("/categorias", getCategoria) //ENPOINT MOSTRAR TODAS LAS CATEGORIAS
router.get("/categorias/cantidad", getCategoriaConCantidadProductos) //ENPOINT DE CATEGORIAS CON LA CANTIDAD DE EPRODUCTOS QUE TIENE CADA UNA
router.get("/categorias/:cod_categoria", getCategoriaById) //ENPOINT DE CATEGORIAS SEGUN SU ID
router.post("/categorias", agregarCategoria) //ENPOINT AGREGAR CATEGORIAS
router.put("/categorias/:cod_categoria", editarCategoria) //ENPOINT EDITAR CATEGORIAS
router.delete("/categorias/:cod_categoria", borrarCategoria) //ENPOINT BORRAR CATEGORIAS

//ENPOINT PRODUCTOS
router.get("/productos", getProductos)// ENPOINT MOSTRAR TODOS LOS PRODUCTOS
router.get("/productos/cantidad", getProductosConCantidadProductos) //ENPOINT CANTIDAD DE PRODUCTOS
router.get("/productos/:id", getProductoById) //ENPOINT DE PRODUCTOS SEGUN SU ID
router.post("/productos", agregarProductos) //ENPOINT AGREGAR PRODUCTOS
router.put("/productos/:id", editarProductos) //ENPOINT EDITAR PRODUCTOS
router.delete("/productos/:id", borrarProductos) //ENPOINT BORRAR PRODUCTOS



export default router