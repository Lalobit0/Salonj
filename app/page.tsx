import { KpiCard } from "@/components/kpi-card";
import { getSupabaseConfig } from "@/lib/env";

export default function Home() {
  const supabase = getSupabaseConfig();

  return (
    <main className="mx-auto max-w-6xl p-4 md:p-8">
      <header className="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
        <div>
          <h1 className="text-3xl font-bold">Joaquín Studio Salon</h1>
          <p className="text-neutral-600">Dashboard inicial del MVP</p>
        </div>
        <span className={`rounded-full px-3 py-1 text-sm font-medium ${supabase.configured ? "bg-emerald-100 text-emerald-700" : "bg-amber-100 text-amber-700"}`}>
          {supabase.configured ? "Supabase conectado" : "Falta configurar Supabase"}
        </span>
      </header>

      <section className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <KpiCard label="Citas de hoy" value="0" />
        <KpiCard label="Clientes registrados" value="0" />
        <KpiCard label="Ingresos aprox. (día)" value="$0" />
      </section>

      <section className="mt-8 rounded-xl border border-neutral-200 bg-white p-5">
        <h2 className="text-xl font-semibold">¿Dónde lo conectaremos?</h2>
        <ul className="mt-3 list-disc space-y-2 pl-5 text-neutral-700">
          <li>Frontend y deploy en <strong>Vercel</strong>.</li>
          <li>Autenticación, base de datos y storage en <strong>Supabase</strong>.</li>
          <li>Variables requeridas: <code>NEXT_PUBLIC_SUPABASE_URL</code> y <code>NEXT_PUBLIC_SUPABASE_ANON_KEY</code>.</li>
        </ul>
      </section>
    </main>
  );
}
