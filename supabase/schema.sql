-- Esquema inicial para MVP V1

create extension if not exists pgcrypto;

create type public.user_role as enum ('admin', 'estilista');
create type public.cita_estado as enum (
  'pendiente',
  'confirmada',
  'en_proceso',
  'finalizada',
  'cancelada'
);

create table if not exists public.users (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid unique,
  nombre text not null,
  email text unique not null,
  rol public.user_role not null default 'estilista',
  activo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.clientes (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  telefono text,
  email text,
  fecha_nacimiento date,
  notas text,
  alergias text,
  consentimiento_fotos boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.expedientes_tecnicos (
  id uuid primary key default gen_random_uuid(),
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  tipo_cabello text,
  historial_quimico text,
  objetivos text,
  restricciones text,
  recomendaciones text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.servicios (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  descripcion text,
  precio_base numeric(10,2),
  duracion_minutos integer,
  activo boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.citas (
  id uuid primary key default gen_random_uuid(),
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  estilista_id uuid references public.users(id),
  fecha_inicio timestamptz not null,
  fecha_fin timestamptz,
  estado public.cita_estado not null default 'pendiente',
  notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.visitas (
  id uuid primary key default gen_random_uuid(),
  cita_id uuid references public.citas(id) on delete set null,
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  estilista_id uuid references public.users(id),
  fecha timestamptz not null default now(),
  costo_final numeric(10,2),
  observaciones text,
  proxima_cita_sugerida date,
  created_at timestamptz not null default now()
);

create table if not exists public.formulas (
  id uuid primary key default gen_random_uuid(),
  visita_id uuid not null references public.visitas(id) on delete cascade,
  servicio_id uuid references public.servicios(id),
  producto text not null,
  tono text,
  proporcion text,
  volumen text,
  tiempo_pose_minutos integer,
  notas text,
  created_at timestamptz not null default now()
);

create table if not exists public.fotos (
  id uuid primary key default gen_random_uuid(),
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  visita_id uuid references public.visitas(id) on delete set null,
  tipo text check (tipo in ('antes', 'despues', 'referencia')),
  storage_path text not null,
  descripcion text,
  created_at timestamptz not null default now()
);

create table if not exists public.visita_servicios (
  visita_id uuid not null references public.visitas(id) on delete cascade,
  servicio_id uuid not null references public.servicios(id) on delete restrict,
  precio numeric(10,2),
  primary key (visita_id, servicio_id)
);

insert into public.servicios (nombre, precio_base, duracion_minutos) values
  ('Corte dama', 350, 60),
  ('Corte caballero', 220, 45),
  ('Tinte', 900, 120),
  ('Balayage', 1800, 180),
  ('Keratina', 1600, 180),
  ('Tratamientos', 500, 60),
  ('Maquillaje', 800, 75),
  ('Uñas', 450, 60)
on conflict (nombre) do nothing;
