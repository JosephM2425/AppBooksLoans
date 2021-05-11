class LoanMailer < ApplicationMailer
    def notification_loan_send(loan)
        @loan = loan
        mail to: loan.user.email, subject: "Prestamo Iniciado", from: "admin@admin.com"
    end
end
