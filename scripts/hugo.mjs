import { spawnSync } from 'node:child_process';
import { dirname, resolve, delimiter } from 'node:path';
import { fileURLToPath } from 'node:url';
const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const sassDir = resolve(root, 'node_modules', `sass-embedded-${process.platform}-${process.arch}`, 'dart-sass');
const result = spawnSync('hugo', process.argv.slice(2), {
  stdio: 'inherit',
  env: { ...process.env, PATH: `${sassDir}${delimiter}${process.env.PATH}` },
});
if (result.error) console.error(result.error.message);
process.exit(result.status ?? 1);
