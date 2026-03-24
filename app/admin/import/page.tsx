'use client';

import { useState } from 'react';
import { Upload, Download, Lock, CircleCheck as CheckCircle, CircleAlert as AlertCircle, Info } from 'lucide-react';

interface ImportResult {
  mode: string;
  total_rows: number;
  valid_rows: number;
  invalid_rows: number;
  imported_count: number;
  updated_count: number;
  skipped_count: number;
  errors: Array<{ row: number; message: string }>;
  example_keys?: string[];
  message: string;
}

export default function AdminImportPage() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [password, setPassword] = useState('');
  const [loginError, setLoginError] = useState('');
  const [loggingIn, setLoggingIn] = useState(false);

  const [file, setFile] = useState<File | null>(null);
  const [mode, setMode] = useState<'upsert' | 'dry_run'>('upsert');
  const [importing, setImporting] = useState(false);
  const [result, setResult] = useState<ImportResult | null>(null);

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setLoginError('');
    setLoggingIn(true);

    try {
      const response = await fetch('/api/admin/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ password }),
      });

      if (response.ok) {
        setIsAuthenticated(true);
        setPassword('');
      } else {
        setLoginError('Invalid password');
      }
    } catch (error) {
      setLoginError('Login failed');
    } finally {
      setLoggingIn(false);
    }
  }

  function downloadTemplate() {
    const template = `passport_slug,destination_slug,pathway_type,pathway_name,summary,eligibility,requirements,processing_time,validity_period,official_url,last_updated
united-states,thailand,Retirement,Non-Immigrant O (Retirement),Long-stay option for retirees,Age/income requirements apply,Passport+financial proof+application,Varies,Typically 90 days then extensions,https://example.com,2026-02-27
canada,portugal,Residency,D7 Visa,Passive income visa for retirees and remote workers,Proof of passive income,Valid passport+income proof+application+health insurance,3-6 months,1 year renewable,https://example.com,2026-02-27`;

    const blob = new Blob([template], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'immigration_pathways_template.csv';
    a.click();
    URL.revokeObjectURL(url);
  }

  async function handleImport(e: React.FormEvent) {
    e.preventDefault();

    if (!file) return;

    setImporting(true);
    setResult(null);

    try {
      const formData = new FormData();
      formData.append('file', file);
      formData.append('mode', mode);

      const response = await fetch('/api/admin/import-immigration-pathways', {
        method: 'POST',
        body: formData,
      });

      const data = await response.json();

      if (response.ok) {
        setResult(data);
      } else {
        setResult({
          mode,
          total_rows: 0,
          valid_rows: 0,
          invalid_rows: 0,
          imported_count: 0,
          updated_count: 0,
          skipped_count: 0,
          errors: [{ row: 0, message: data.error || 'Import failed' }],
          message: 'Import failed',
        });
      }
    } catch (error) {
      setResult({
        mode,
        total_rows: 0,
        valid_rows: 0,
        invalid_rows: 0,
        imported_count: 0,
        updated_count: 0,
        skipped_count: 0,
        errors: [{ row: 0, message: 'Network error' }],
        message: 'Import failed',
      });
    } finally {
      setImporting(false);
    }
  }

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
        <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8 max-w-md w-full">
          <div className="flex items-center space-x-3 mb-6">
            <Lock className="h-6 w-6 text-brand-primary" />
            <h1 className="text-2xl font-semibold text-gray-900">Admin Access</h1>
          </div>

          <p className="text-gray-600 mb-6">
            Enter the admin password to access the immigration pathways import tool.
          </p>

          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label htmlFor="password" className="block text-sm font-medium text-gray-900 mb-2">
                Password
              </label>
              <input
                type="password"
                id="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
                required
                autoComplete="current-password"
              />
            </div>

            {loginError && (
              <div className="flex items-center space-x-2 text-red-600 text-sm">
                <AlertCircle className="h-4 w-4" />
                <span>{loginError}</span>
              </div>
            )}

            <button
              type="submit"
              disabled={loggingIn}
              className="w-full bg-brand-primary hover:bg-indigo-700 disabled:bg-gray-400 text-white font-medium py-3 px-6 rounded-md transition-colors"
            >
              {loggingIn ? 'Authenticating...' : 'Login'}
            </button>
          </form>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-12">
        <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8 mb-6">
          <div className="flex items-center space-x-3 mb-4">
            <Upload className="h-6 w-6 text-brand-primary" />
            <h1 className="text-2xl font-semibold text-gray-900">
              Import Immigration Pathways
            </h1>
          </div>

          <p className="text-gray-600 mb-6">
            Upload a CSV file to import or update immigration pathway data.
          </p>

          <div className="bg-blue-50 border border-blue-200 rounded-md p-4 mb-6">
            <div className="flex items-start space-x-3">
              <Info className="h-5 w-5 text-blue-600 mt-0.5 flex-shrink-0" />
              <div className="text-sm text-blue-900">
                <p className="font-medium mb-1">CSV Format Requirements:</p>
                <ul className="list-disc list-inside space-y-1 text-blue-800">
                  <li>Required columns: passport_slug, destination_slug, pathway_type, pathway_name</li>
                  <li>Optional columns: summary, eligibility, requirements, processing_time, validity_period, official_url, last_updated</li>
                  <li>pathway_type must be: Work, Residency, Digital Nomad, Study, Investor, Retirement, Family, or Other</li>
                  <li>last_updated format: YYYY-MM-DD</li>
                </ul>
              </div>
            </div>
          </div>

          <button
            onClick={downloadTemplate}
            className="flex items-center space-x-2 text-brand-primary hover:text-indigo-700 font-medium mb-6"
          >
            <Download className="h-5 w-5" />
            <span>Download CSV Template</span>
          </button>

          <form onSubmit={handleImport} className="space-y-6">
            <div>
              <label htmlFor="file" className="block text-sm font-medium text-gray-900 mb-2">
                CSV File
              </label>
              <input
                type="file"
                id="file"
                accept=".csv"
                onChange={(e) => setFile(e.target.files?.[0] || null)}
                className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-medium file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100"
                required
              />
            </div>

            <div>
              <label htmlFor="mode" className="block text-sm font-medium text-gray-900 mb-2">
                Import Mode
              </label>
              <select
                id="mode"
                value={mode}
                onChange={(e) => setMode(e.target.value as 'upsert' | 'dry_run')}
                className="w-full px-4 py-2.5 border border-gray-300 rounded-md text-gray-900 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
              >
                <option value="upsert">Upsert (Insert new, Update existing)</option>
                <option value="dry_run">Dry Run (Validate only, no changes)</option>
              </select>
            </div>

            <button
              type="submit"
              disabled={importing || !file}
              className="w-full bg-brand-primary hover:bg-indigo-700 disabled:bg-gray-400 text-white font-medium py-3 px-6 rounded-md transition-colors"
            >
              {importing ? 'Processing...' : 'Validate & Import'}
            </button>
          </form>
        </div>

        {result && (
          <div className="bg-white rounded-lg border border-gray-200 shadow-sm p-8">
            <h2 className="text-xl font-semibold text-gray-900 mb-4">Import Results</h2>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
              <div className="bg-gray-50 rounded-md p-4">
                <div className="text-sm text-gray-600 mb-1">Total Rows</div>
                <div className="text-2xl font-semibold text-gray-900">{result.total_rows}</div>
              </div>
              <div className="bg-green-50 rounded-md p-4">
                <div className="text-sm text-green-600 mb-1">Valid Rows</div>
                <div className="text-2xl font-semibold text-green-700">{result.valid_rows}</div>
              </div>
              <div className="bg-blue-50 rounded-md p-4">
                <div className="text-sm text-blue-600 mb-1">Imported</div>
                <div className="text-2xl font-semibold text-blue-700">{result.imported_count}</div>
              </div>
              <div className="bg-amber-50 rounded-md p-4">
                <div className="text-sm text-amber-600 mb-1">Updated</div>
                <div className="text-2xl font-semibold text-amber-700">{result.updated_count}</div>
              </div>
            </div>

            {result.message && (
              <div className={`flex items-center space-x-2 p-4 rounded-md mb-6 ${
                result.errors.length > 0 ? 'bg-amber-50 text-amber-900' : 'bg-green-50 text-green-900'
              }`}>
                {result.errors.length > 0 ? (
                  <AlertCircle className="h-5 w-5 text-amber-600 flex-shrink-0" />
                ) : (
                  <CheckCircle className="h-5 w-5 text-green-600 flex-shrink-0" />
                )}
                <span className="font-medium">{result.message}</span>
              </div>
            )}

            {result.example_keys && result.example_keys.length > 0 && (
              <div className="mb-6">
                <h3 className="text-sm font-medium text-gray-900 mb-2">Example Processed Pathways:</h3>
                <ul className="list-disc list-inside space-y-1 text-sm text-gray-700">
                  {result.example_keys.map((key, index) => (
                    <li key={index}>{key}</li>
                  ))}
                </ul>
              </div>
            )}

            {result.errors.length > 0 && (
              <div>
                <h3 className="text-sm font-medium text-gray-900 mb-2">
                  Errors ({result.errors.length} {result.errors.length > 50 ? '- showing first 50' : ''}):
                </h3>
                <div className="bg-red-50 border border-red-200 rounded-md p-4 max-h-96 overflow-y-auto">
                  <ul className="space-y-2 text-sm">
                    {result.errors.map((error, index) => (
                      <li key={index} className="text-red-900">
                        {error.row > 0 && <span className="font-medium">Row {error.row}: </span>}
                        {error.message}
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
