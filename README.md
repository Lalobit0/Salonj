# Joaquín Studio Salon — Sistema Web (MVP V1)

Base inicial del sistema web responsive para la gestión de clientes, citas y expediente técnico.

## Stack
- Next.js 15 + TypeScript
- Tailwind CSS
- Supabase (Auth + PostgreSQL + Storage)
- Deploy: Vercel

## Arranque local
```bash
npm install
cp .env.example .env
npm run dev
```

Abrir en `http://localhost:3000`.

## ¿A dónde lo conectaremos?
1. **Supabase**: proyecto nuevo para Auth, DB y Storage.
2. **Vercel**: conectar este repositorio para deploy automático.
3. Configurar en Vercel y local estas variables:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## Base de datos
Aplicar `supabase/schema.sql` en el SQL Editor de Supabase para crear:
- Tablas: `users`, `clientes`, `expedientes_tecnicos`, `servicios`, `citas`, `visitas`, `formulas`, `fotos`, `visita_servicios`
- Enums: `user_role`, `cita_estado`
- Seed inicial del catálogo de servicios

## Estado actual
- Dashboard inicial renderizado
- Verificación visual de si Supabase está configurado
- Base de datos lista para iniciar CRUD de clientes/citas
