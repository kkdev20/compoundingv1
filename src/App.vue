<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 via-white to-gray-50 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 py-4 px-4 transition-colors duration-300">
    <div class="max-w-4xl mx-auto">
      <!-- Header dengan Toggle -->
      <div class="flex justify-between items-center mb-4">
        <header class="text-center flex-1">
          <h1 class="text-xl font-bold text-gray-800 dark:text-white mb-1">Aplikasi Compounding Interest</h1>
          <p class="text-xs text-gray-600 dark:text-gray-400">Hitung keuntungan dengan bunga majemuk harian</p>
        </header>
        <button
          @click="toggleDarkMode"
          class="ml-4 p-2 rounded-lg bg-white dark:bg-gray-700 shadow-md hover:shadow-lg transition-all duration-200 border border-gray-200 dark:border-gray-600"
          aria-label="Toggle dark mode"
        >
          <svg v-if="!isDark" class="w-5 h-5 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path>
          </svg>
          <svg v-else class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
          </svg>
        </button>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-3 mb-3">
        <!-- Kolom Kiri: Form Input -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg dark:shadow-xl border border-gray-200 dark:border-gray-700 p-4 transition-all duration-300">
          <div class="space-y-2.5">
            <div>
              <label for="modal" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                Modal Awal (Rp)
              </label>
              <input
                id="modal"
                type="text"
                :value="formatNumber(modal)"
                @input="handleModalInput($event)"
                placeholder="Masukkan modal awal"
                class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg text-sm bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400 focus:border-transparent transition-all duration-200"
              />
            </div>

            <div>
              <label for="persentase" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                Persentase Harian (%)
              </label>
              <input
                id="persentase"
                type="number"
                v-model.number="persentase"
                placeholder="Masukkan persentase harian"
                min="0"
                step="0.01"
                class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg text-sm bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400 focus:border-transparent transition-all duration-200"
              />
            </div>

            <div>
              <label for="periode" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                Periode (Hari)
              </label>
              <input
                id="periode"
                type="number"
                v-model.number="periode"
                placeholder="Masukkan periode dalam hari"
                min="1"
                class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg text-sm bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:focus:ring-blue-400 focus:border-transparent transition-all duration-200"
              />
            </div>

            <div class="flex gap-2 mt-2">
              <button
                @click="hitung"
                class="flex-1 bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 dark:from-blue-500 dark:to-blue-600 dark:hover:from-blue-600 dark:hover:to-blue-700 text-white font-medium py-2.5 px-4 rounded-lg text-sm transition-all duration-200 shadow-md hover:shadow-lg transform hover:-translate-y-0.5"
              >
                Hitung
              </button>
              <button
                @click="reset"
                class="px-4 py-2.5 bg-gray-200 dark:bg-gray-700 hover:bg-gray-300 dark:hover:bg-gray-600 text-gray-700 dark:text-gray-300 font-medium rounded-lg text-sm transition-all duration-200 shadow-md hover:shadow-lg"
              >
                Reset
              </button>
            </div>
          </div>
        </div>

        <!-- Kolom Kanan: Ringkasan -->
        <div v-if="hasil.length > 0" class="bg-white dark:bg-gray-800 rounded-xl shadow-lg dark:shadow-xl border border-gray-200 dark:border-gray-700 p-4 transition-all duration-300">
          <h2 class="text-base font-semibold text-gray-800 dark:text-white mb-2.5">Ringkasan</h2>
          <div class="space-y-2.5">
            <div class="flex justify-between items-center text-sm p-2 rounded-lg bg-gray-50 dark:bg-gray-700/50">
              <span class="text-gray-600 dark:text-gray-400 font-medium">Modal Awal:</span>
              <span class="text-gray-800 dark:text-gray-200 font-semibold">{{ formatCurrency(modal) }}</span>
            </div>
            <div class="flex justify-between items-center text-sm p-2 rounded-lg bg-blue-50 dark:bg-blue-900/20">
              <span class="text-gray-600 dark:text-gray-400 font-medium">Modal Akhir:</span>
              <span class="text-blue-600 dark:text-blue-400 font-semibold">{{ formatCurrency(modalAkhir) }}</span>
            </div>
            <div class="flex justify-between items-center text-sm p-2 rounded-lg bg-green-50 dark:bg-green-900/20">
              <span class="text-gray-600 dark:text-gray-400 font-medium">Total Keuntungan:</span>
              <span class="text-green-600 dark:text-green-400 font-semibold">{{ formatCurrency(totalKeuntungan) }}</span>
            </div>
            <div class="flex justify-between items-center text-sm p-2 rounded-lg bg-green-50 dark:bg-green-900/20">
              <span class="text-gray-600 dark:text-gray-400 font-medium">ROI:</span>
              <span class="text-green-600 dark:text-green-400 font-semibold">{{ roi.toFixed(2) }}%</span>
            </div>
          </div>
        </div>

        <!-- Placeholder untuk kolom kanan saat belum ada hasil -->
        <div v-else class="bg-white dark:bg-gray-800 rounded-xl shadow-lg dark:shadow-xl border border-gray-200 dark:border-gray-700 p-4 transition-all duration-300">
          <h2 class="text-base font-semibold text-gray-800 dark:text-white mb-2.5">Ringkasan</h2>
          <p class="text-xs text-gray-400 dark:text-gray-500 text-center py-3">Masukkan data dan klik Hitung untuk melihat ringkasan</p>
        </div>
      </div>

      <!-- Tabel Detail - Full Width -->
      <div v-if="hasil.length > 0" class="bg-white dark:bg-gray-800 rounded-xl shadow-lg dark:shadow-xl border border-gray-200 dark:border-gray-700 p-4 transition-all duration-300">
        <h2 class="text-base font-semibold text-gray-800 dark:text-white mb-2.5">Detail Per Hari</h2>
        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="bg-gradient-to-r from-blue-600 to-blue-700 dark:from-blue-500 dark:to-blue-600 text-white">
                <th class="px-3 py-2.5 text-left font-semibold">Hari</th>
                <th class="px-3 py-2.5 text-left font-semibold">Modal Awal</th>
                <th class="px-3 py-2.5 text-left font-semibold">Bunga Harian</th>
                <th class="px-3 py-2.5 text-left font-semibold">Modal Akhir</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, index) in hasil" :key="index" class="border-b border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700/50 transition-colors duration-150">
                <td class="px-3 py-2 text-gray-700 dark:text-gray-300">{{ item.hari }}</td>
                <td class="px-3 py-2 text-gray-700 dark:text-gray-300">{{ formatCurrency(item.modalAwal) }}</td>
                <td class="px-3 py-2 text-green-600 dark:text-green-400 font-medium">{{ formatCurrency(item.bunga) }}</td>
                <td class="px-3 py-2 text-blue-600 dark:text-blue-400 font-medium">{{ formatCurrency(item.modalAkhir) }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Footer Copyright -->
      <footer class="mt-6 text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400">
          © 2024 
          <a 
            href="https://wistack.site" 
            target="_blank" 
            rel="noopener noreferrer"
            class="text-blue-600 dark:text-blue-400 hover:text-blue-700 dark:hover:text-blue-300 font-medium transition-colors duration-200"
          >
            wistack.site
          </a>
        </p>
      </footer>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted } from 'vue'

export default {
  name: 'App',
  setup() {
    const modal = ref(100000)
    const persentase = ref(5)
    const periode = ref(10)
    const hasil = ref([])
    const isDark = ref(false)

    // Load dark mode preference from localStorage
    onMounted(() => {
      const savedTheme = localStorage.getItem('theme')
      if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        isDark.value = true
        document.documentElement.classList.add('dark')
      }
    })

    const toggleDarkMode = () => {
      isDark.value = !isDark.value
      if (isDark.value) {
        document.documentElement.classList.add('dark')
        localStorage.setItem('theme', 'dark')
      } else {
        document.documentElement.classList.remove('dark')
        localStorage.setItem('theme', 'light')
      }
    }

    const modalAkhir = computed(() => {
      if (hasil.value.length > 0) {
        return hasil.value[hasil.value.length - 1].modalAkhir
      }
      return 0
    })

    const totalKeuntungan = computed(() => {
      return modalAkhir.value - modal.value
    })

    const roi = computed(() => {
      if (modal.value > 0) {
        return (totalKeuntungan.value / modal.value) * 100
      }
      return 0
    })

    const formatNumber = (value) => {
      if (value === null || value === undefined || value === '') return ''
      const numValue = typeof value === 'number' ? value : parseInt(value, 10)
      if (isNaN(numValue)) return ''
      return numValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')
    }

    const parseNumber = (value) => {
      if (!value) return 0
      const cleaned = value.toString().replace(/\./g, '')
      const parsed = parseInt(cleaned, 10)
      return isNaN(parsed) ? 0 : parsed
    }

    const handleModalInput = (event) => {
      const value = event.target.value
      modal.value = parseNumber(value)
    }

    const formatCurrency = (value) => {
      return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
      }).format(value)
    }

    const hitung = () => {
      if (modal.value <= 0 || persentase.value <= 0 || periode.value <= 0) {
        alert('Harap isi semua field dengan nilai yang valid!')
        return
      }

      hasil.value = []
      let currentModal = modal.value

      for (let hari = 1; hari <= periode.value; hari++) {
        const modalAwalHari = currentModal
        const bunga = (modalAwalHari * persentase.value) / 100
        const modalAkhirHari = modalAwalHari + bunga

        hasil.value.push({
          hari: hari,
          modalAwal: modalAwalHari,
          bunga: bunga,
          modalAkhir: modalAkhirHari
        })

        currentModal = modalAkhirHari
      }
    }

    const reset = () => {
      modal.value = 100000
      persentase.value = 5
      periode.value = 10
      hasil.value = []
    }

    return {
      modal,
      persentase,
      periode,
      hasil,
      modalAkhir,
      totalKeuntungan,
      roi,
      isDark,
      toggleDarkMode,
      formatNumber,
      handleModalInput,
      formatCurrency,
      hitung,
      reset
    }
  }
}
</script>

