import typescriptParser from '@typescript-eslint/parser';
import typescriptPlugin from '@typescript-eslint/eslint-plugin';
import globals from 'globals';

export default [
  {
    languageOptions: {
      parser: typescriptParser,
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        project: './tsconfig.json'
      },
      globals: {
        ...globals.node
      }
    },
    files: ['**/*.ts', '**/*.js'],
    plugins: {
      '@typescript-eslint': typescriptPlugin
    },
    rules: {
      // Base rules
      'no-console': 'warn',
      'eqeqeq': ['error', 'always'],

      // TypeScript specific rules
      '@typescript-eslint/no-unused-vars': ['error', {
        'argsIgnorePattern': '^_',
        'varsIgnorePattern': '^_'
      }],
      '@typescript-eslint/no-explicit-any': 'warn',
      '@typescript-eslint/no-floating-promises': 'error'
    },
    ignores: ['node_modules/**', 'dist/**', '.eslintrc.js', '**/*.config.js']
  }
];
