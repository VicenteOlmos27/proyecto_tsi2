
import { Table, Column, Model, DataType } from "sequelize-typescript";

@Table({ tableName: "pedido" })
export class Pedido extends Model {
  @Column({
    type: DataType.STRING(10),
    primaryKey: true,
    allowNull: false,
    field: "cod_pedido",
  })
  declare cod_pedido: string;

  @Column({
    type: DataType.DATEONLY,
    allowNull: false,
    field: "fecha",
  })
  declare fecha: Date;

  @Column({
    type: DataType.TINYINT,
    allowNull: false,
    field: "estado",
  })
  declare estado: number;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    field: "total",
  })
  declare total: number;

  @Column({
    type: DataType.STRING(60),
    allowNull: true,
    field: "comprobante",
  })
  declare comprobante?: string;

  @Column({
    type: DataType.STRING(20),
    allowNull: true,
    field: "empresa_envio",
  })
  declare empresa_envio?: string;

  @Column({
    type: DataType.DATEONLY,
    allowNull: true,
    field: "fecha_envio",
  })
  declare fecha_envio?: Date;

  @Column({
    type: DataType.DATEONLY,
    allowNull: true,
    field: "fecha_entrega",
  })
  declare fecha_entrega?: Date;
}

export default Pedido;
