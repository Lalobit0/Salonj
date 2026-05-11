# Sistema para Estética — Especificación Funcional V1

## 1. Objetivo
Crear un sistema web para una estética/salón de belleza, operado inicialmente por un estilista, que sustituya agenda escrita y expediente físico para administrar:
- Clientes
- Citas
- Historial técnico
- Fórmulas de color
- Servicios realizados
- Recordatorios por WhatsApp

## 2. Plataforma
Sistema web responsive (móvil, tablet, laptop, PC), con:
- Login sencillo
- Panel administrativo
- Sesión persistente

## 3. Módulos principales (V1)

### Login
- Usuario/correo
- Contraseña
- Recuperación de contraseña (opcional)
- Roles: Administrador/Dueño, Estilista

### Dashboard
- Citas de hoy
- Próxima cita
- Clientes registrados
- Citas pendientes / confirmadas / canceladas
- Servicios realizados
- Ingresos aproximados
- Accesos rápidos

### Clientes
- Crear/editar/buscar cliente
- Ver expediente completo
- Historial de servicios
- Fotos antes/después

### Agenda / Citas
- Crear/editar/cancelar/confirmar cita
- Vista diaria y semanal
- WhatsApp con mensaje prellenado

### Servicios
Catálogo inicial:
- Corte dama
- Corte caballero
- Tinte
- Balayage
- Keratina
- Tratamientos
- Maquillaje
- Uñas

### Historial técnico
- Fórmulas usadas
- Productos
- Volumen
- Tiempo de pose
- Costo final
- Próxima cita sugerida
- Fotos

## 4. Flujo operativo

### Cliente nuevo
1. Capturar datos generales
2. Capturar expediente técnico
3. Guardar cliente
4. Crear cita
5. Enviar confirmación por WhatsApp

### Cliente existente
6. Buscar cliente
7. Abrir expediente
8. Crear nueva cita
9. Confirmar cita

### Día de la cita
10. Abrir agenda
11. Marcar cita en proceso
12. Registrar servicio realizado
13. Guardar fórmula/procedimiento
14. Subir fotos
15. Guardar costo final
16. Finalizar cita

## 5. Entidades de datos (alto nivel)
- users
- clientes
- expedientes_tecnicos
- servicios
- citas
- visitas
- formulas
- fotos

## 6. Stack recomendado
- Frontend: Next.js + TypeScript
- Estilos: Tailwind CSS
- Backend/BaaS: Supabase
- DB: PostgreSQL
- Storage: Supabase Storage
- Deploy: Vercel

## 7. MVP Inicial
- Login
- Clientes
- Expediente técnico
- Agenda
- Servicios
- Historial de visitas
- Fórmulas
- Fotos
- WhatsApp manual
- Dashboard básico
