import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Joaquín Studio Salon",
  description: "Sistema web para gestión de clientes y citas",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <body>{children}</body>
    </html>
  );
}
