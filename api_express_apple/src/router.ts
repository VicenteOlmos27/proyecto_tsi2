import { Router } from "express";
import { agregarProductos, borrarProductos, editarProductos, getProductoById, getProductos, getProductosConCantidadProductos } from "./handlers/productos";
import { agregarCategoria, borrarCategoria, editarCategoria, getCategoria, getCategoriaById, getCategoriaConCantidadProductos } from "./handlers/categorias";
import { crearCliente, login } from "./handlers/clientes";
import { verificarTokens } from "./middleware/verificarTokens";
import { borrarPedido, crearPedido, getPedidoById, getPedidosActivos, getPedidosEntregados, registrarEntrega, registrarEnvio } from "./handlers/pedido";

const router = Router()

//ENPOINT CLIENTES
router.post("/login", login)
router.post("/clientes/crear", crearCliente)

//MIDDLEWARE DESDE AQUI
router.use(verificarTokens)

//ENPOINT CATEGORIAS
router.get("/categorias", getCategoria) //ENPOINT MOSTRAR TODAS LAS CATEGORIAS
router.get("/categorias/cantidad", getCategoriaConCantidadProductos) //ENPOINT DE CATEGORIAS CON LA CANTIDAD DE PRODUCTOS QUE TIENE CADA UNA
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

//ENPOINT DE PEDIDOS
router.get("/pedidos/activos", getPedidosActivos) //ENPOINT MOSTRAR PEDIDOS ACTIVOS
router.get("/pedidos/entregados", getPedidosEntregados) //ENPOINT MOSTRAR PEDIDOS ENTREGADOS
router.get("/pedidos/informacion", getPedidoById) //ENPOINT MOSTRAR INFO DE PEDIDOS
router.post("/pedido/crear", crearPedido) //ENPOINT CREAR PEDIDOS
router.put("/pedidos/:cod_pedido", registrarEnvio) //ENPOINT REGISTRAR ENVIO
router.put("/pedidos/:cod_pedido", registrarEntrega) //ENPOINT REGISTRAR ENTREGA
router.delete("/pedidos/:cod_pedido", borrarPedido) //ENPOINT BORRAR PEDIDO

export default router