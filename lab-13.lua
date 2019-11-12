io.write('Vvedite prozhitochniy minimum: ')
pr_min = io.read()
pr_min = tonumber(pr_min)

print('Mesyats', ' ', 'Zarplata', 'Pens. fond', 'Prozh. minimum', 'Podoh. nalog', 'V itoge ZP')
mes = {'Jan','Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'}
zar = {}
pens = {}
proz = {}
doh = {}
itog = {}
sum = 0
max = 0
min = 20001
pens_sum = 0
sum_doh = 0
itog_doh = 0
sum_proz = 0
sum_itog = 0

for i = 1, #mes do
        zar[i] = math.random(5000, 20000)
        pens[i] = zar[i] / 100 * 2
        sum = sum + zar[i]
        pens_sum = pens_sum + pens[i]

        if zar[i] > max then
                max = zar[i]
                max_m = i
        end

        if zar[i] < min then
                min = zar[i]
                min_m = i
        end

        if zar[i] < pr_min then
                proz[i] = '+'
        else
                proz[i] = '-'
                sum_proz = sum_proz + 1
        end
        sum_doh = sum_doh + zar[i]

        if sum_doh < 20000 then
                doh_mes = i + 1
        end

        if i < doh_mes then
                doh[i] = 0
        else
                doh[i] = zar[i] / 100 * 13
                itog_doh = itog_doh + doh[i]
        end

        itog[i] = zar[i] - pens[i] - doh[i]
        sum_itog = sum_itog + itog[i]

        print(mes[i], ' ', zar[i], ' ', pens[i], ' ', proz[i], ' ', doh[i], ' ', itog[i])
end

srz = sum / #mes

print('\n')
print('Vsego:', ' ', sum, ' ', pens_sum, ' ', sum_proz..' mes.',  ' ', itog_doh, ' ', sum_itog)
print('\n')
print('Srednyaya zarplata sotrudnika: '..string.format("%.2f", srz))
print('Maximalnaya summa zarplati: '..max..' bila v '..max_m..' mesyatse')
print('Minimalnaya summa zarplati: '..min..' bila v '..min_m..' mesyatse')
