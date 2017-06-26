#ifndef COMMUNICATION_SETTINGS_PRESENTER_H
#define COMMUNICATION_SETTINGS_PRESENTER_H

// Internal
#include "base_presenter.h"
#include "db_traits.h"

namespace domain
{
    class DomainEntry;
}

namespace presentation
{
    class CommunicationSettingsPresenter: public BasePresenter
    {
        Q_OBJECT

    public:
        explicit CommunicationSettingsPresenter(domain::DomainEntry* entry,
                                                QObject* parent = nullptr);
        ~CommunicationSettingsPresenter() override;

    protected:
        void connectView(QObject* view) override;

    private slots:
        void onLinkAdded(const db::LinkDescriptionPtr& description);
        void onLinkChanged(const db::LinkDescriptionPtr& description);
        void onLinkStatisticsChanged(const db::LinkDescriptionPtr& description);
        void onLinkRemoved(const db::LinkDescriptionPtr& description);
        void updateCommunicationsLinks();

        void onAddUdpLink();
        void onAddSerialLink();

    private:
        class Impl;
        QScopedPointer<Impl> const d;
    };
}

#endif // COMMUNICATION_SETTINGS_PRESENTER_H