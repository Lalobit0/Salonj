import { createClient } from "@supabase/supabase-js";
import { getSupabaseConfig } from "@/lib/env";

export function createSupabaseBrowserClient() {
  const config = getSupabaseConfig();

  if (!config.configured) return null;

  return createClient(config.url, config.anonKey);
}
